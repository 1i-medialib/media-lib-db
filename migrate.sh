docker run --rm \
    -v ${PWD}/sql:/flyway/sql \
    -v ${PWD}/conf:/flyway/conf \
    flyway/flyway migrate -X