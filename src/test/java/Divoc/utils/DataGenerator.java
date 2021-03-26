package Divoc.utils;

import java.util.Random;

public class DataGenerator {
    public static String generateRandomNumber() {
        Random rand = new Random();
        long x = (long) (Math.random() * 100000000000000L);
        return String.format("%014d", x);
    }
}
