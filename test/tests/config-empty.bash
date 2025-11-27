test_description='empty config disallowed'
. '../test-lib.bash'

test_expect_failure 'run' '
run_qonfig <<EOF
EOF
'
