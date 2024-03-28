export def main [] {
  with-env [
    AWS_PROFILE "infrastructure-testing-service-account"
    AWS_REGION "us-east-1"
    TEA_DIR $env.HOME
  ] {
  
    tea -E aws configure

    (
      tea -E
      aws eks update-cluster-config
      --name infrastructure
      --resources-vpc-config $'{"publicAccessCidrs": ["(http get https://ifconfig.me/ip)/32"]}'
    )

    (
      tea -E
      aws eks update-kubeconfig
      --name infrastructure
    )

    open ~/.kube/config
    | from yaml
    | update users.user.exec.command "tea"
    | update users.user.exec.args {|config| $config.users.user.exec.args | flatten | prepend "aws"}
    | to yaml
    | save -f ~/.kube/config
  }
}

