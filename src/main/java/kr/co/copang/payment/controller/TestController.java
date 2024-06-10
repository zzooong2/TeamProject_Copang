package kr.co.copang.payment.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.concurrent.atomic.AtomicInteger;

public class TestController {
    private static AtomicInteger counter = new AtomicInteger(0);

    public static void main(String[] args) {
        String orderNumber = generateOrderNumber();
        System.out.println("생성된 주문 번호: " + orderNumber);
    }

    private static String generateOrderNumber() {
        // 오늘 날짜 가져오기
        String date = new SimpleDateFormat("yyyyMMdd").format(new Date());

        // 1에서 5 사이의 랜덤 숫자 생성
        Random random = new Random();
        int randomNumber = 1 + random.nextInt(5);

        // 001부터 시작하여 순차적으로 증가하는 번호 생성
        int sequenceNumber = counter.incrementAndGet();
        String formattedSequenceNumber = String.format("%03d", sequenceNumber);

        // 날짜, 랜덤 숫자, 순차 번호를 결합하여 주문 번호 생성
        return date + randomNumber + formattedSequenceNumber;
    }
}