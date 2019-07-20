const foregroundColor = '#eff0eb'
const backgroundColor = '#151515'
const red = '#ff5c57'
const green = '#5af78e'
const yellow = '#f3f99d'
const blue = '#57c7ff'
const magenta = '#ff6ac1'
const cyan = '#9aedfe'

module.exports = {
    config: {
        shell: 'zsh',

        fontSize: 12,

        fontFamily:
            '"Input Mono", "Source Code Pro", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',

        backgroundColor,
        foregroundColor,
        borderColor: '#222430',
        cursorColor: '#97979b',
        cursorAccentColor: backgroundColor,
        selectionColor: 'rgba(151, 151, 155, 0.2)',
        colors: {
            black: backgroundColor,
            red,
            green,
            yellow,
            blue,
            magenta,
            cyan,
            white: '#f1f1f0',
            lightBlack: '#686868',
            lightRed: red,
            lightGreen: green,
            lightYellow: yellow,
            lightBlue: blue,
            lightMagenta: magenta,
            lightCyan: cyan,
            lightWhite: foregroundColor
        },
        hyperCustomTouchbar: [
            { label: 'clear', command: 'clear', backgroundColor: '#d13232' },
            { label: 'man', command: 'man ', prompt: true },
            {
                label: 'git',
                options: [
                    { label: 'diff', command: 'git diff' },
                    { label: 'status', command: 'git status' },
                    { label: 'log', command: 'git log' },
                    {
                        label: 'add .',
                        command: 'git add .',
                        icon: '/tmp/icons8-add-file-44.png',
                        iconPosition: 'right'
                    },
                    { label: 'clone', command: 'git clone ', prompt: true }
                ]
            },
            {
                label: 'vim',
                options: [
                    { label: 'quit', command: ':q!', esc: true },
                    { label: 'save & quit', command: ':x', esc: true }
                ]
            }
        ]
    },

    plugins: [
        'hyperlinks',
        'hyperminimal',
        'hyperfullscreen',
        'hyperterm-paste',
        'hyper-custom-touchbar'
    ]
}
