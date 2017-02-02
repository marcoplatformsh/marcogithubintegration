#! /usr/bin/env bash

# version: 1

printp() {
    local -r parameter_name=$1
    printf '%s: %s\n' \
        "$parameter_name" \
        "${!parameter_name}"
}

decodep() {
    local -r parameter_name=$1
    local -r decoded_value=$(base64 --decode <<< "${!parameter_name}")
    printf '%s: %s\n' \
        "$parameter_name" \
        "$decoded_value"
}

cat() {
    local -r filepath=$1
    printf '%s:\n' \
        "$filepath"
    command cat "$filepath"
    echo
}

parameter_names=(
    HOSTNAME
    MACHTYPE
    BASH_VERSION
    SHELL
    PLATFORM_PROJECT
    PLATFORM_ENVIRONMENT
    PLATFORM_BRANCH
    PLATFORM_APPLICATION_NAME
    PLATFORM_APP_DIR
    VARIABLE1
)

for parameter_name in "${parameter_names[@]}"; do
    printp "$parameter_name"
done
echo

encoded_parameters=(
    PLATFORM_APPLICATION
    PLATFORM_RELATIONSHIPS
    PLATFORM_ROUTES
    PLATFORM_VARIABLES
)

for parameter_name in "${encoded_parameters[@]}"; do
    decodep "$parameter_name"
done
echo


filepaths=(
    ../README.md
    marcogithub/README.md
    marcogithubparallel/README.md
    marcogithub/marcogithubnested/README.md
    /tmp/cron_output
)

num_lines=3
for filepath in "${filepaths[@]}"; do
    printf '* %s: (last %d lines)\n' "$filepath" "$num_lines" 
    tail --lines="$num_lines" "$filepath"
    echo
done
