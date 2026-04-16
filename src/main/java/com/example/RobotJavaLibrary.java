package com.example;

import java.util.ArrayList;
import java.util.List;

import org.robotframework.remoteserver.RemoteServer;

public class RobotJavaLibrary {

    public String helloFromJava() {
        return "hello from java";
    }

    public int multiply(int a, int b) {
        return a * b;
    }

    public List<String> generateFoobar(int count) {
        if (count < 0) {
            throw new IllegalArgumentException("Parameter must be non-negative.");
        }
        List<String> results = new ArrayList<>();
        for (int i = 1; i <= count; i++) {
            String value = "";
            if (i % 3 == 0) {
                value += "foo";
            }
            if (i % 5 == 0) {
                value += "bar";
            }
            if (value.isEmpty()) {
                results.add(Integer.toString(i));
            } else {
                results.add(value);
            }
        }
        return results;
    }

    public static void main(String[] args) throws Exception {
        int port = 8270;
        if (args.length > 0) {
            port = Integer.parseInt(args[0]);
        }

        RemoteServer server = new RemoteServer(port);
        server.putLibrary("/", new RobotJavaLibrary());
        server.start();

        System.out.println("Robot Framework remote server started on port " + server.getLocalPort());
        System.out.println("Keywords available: Hello from Java, Multiply, Generate Foobar");
    }
}
