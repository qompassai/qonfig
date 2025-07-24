test_description='json config allowed'
. '../test-lib.bash'

test_expect_success 'setup' '
echo "grape" > ${DOTFILES}/h
'

test_expect_success 'run' '
run_qonfig_json <<EOF
[{
    "link": {
        "~/.i": "h"
    }
}]
EOF
'

test_expect_success 'test' '
grep "grape" ~/.i
'
