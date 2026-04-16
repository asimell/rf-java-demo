# rf-java-demo

Demo Java library to be used with Robot Framework

## Build

```bash
mvn package
```

## Run

```bash
java -jar target/rf-java-demo-1.0.0.jar
```

To use a different port, pass it as the first argument:

```bash
java -jar target/rf-java-demo-1.0.0.jar 8271
```

## Exposed keywords

- `Hello from Java`
- `Multiply`
- `Generate Foobar`

## Running Robot Framework Tests

```bash
robot -d output tests/my_library_tests.robot
```

## Used Versions

- Robot Framework: `7.4.2`
- Python: `3.14.4`
- Java: `25.0.1`
