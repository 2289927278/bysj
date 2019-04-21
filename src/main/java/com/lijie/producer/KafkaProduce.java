/*package com.lijie.producer;

import java.io.File;
import java.io.FileInputStream;
import java.util.Properties;

import org.apache.kafka.clients.producer.Callback;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.clients.producer.RecordMetadata;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class KafkaProduce {
    private static Properties properties;

    static {
        properties = new Properties();
        String path = KafkaProducer.class.getResource("/").getFile().toString()
                + "kafka.properties";
        try {
            FileInputStream fis = new FileInputStream(new File(path));
            properties.load(fis);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    *//**
     * 发送消息
     * 
     * @param topic
     * @param key
     * @param value
     *//*
    public void sendMsg(String topic, byte[] key, byte[] value) {

        // 实例化produce
        KafkaProducer<byte[], byte[]> kp = new KafkaProducer<byte[], byte[]>(
                properties);

        // 消息封装
        ProducerRecord<byte[], byte[]> pr = new ProducerRecord<byte[], byte[]>(
                topic, key, value);

        // 发送数据
        kp.send(pr, new Callback() {
            // 回调函数
            @Override
            public void onCompletion(RecordMetadata metadata,
                    Exception exception) {
                if (null != exception) {
                    System.out.println("记录的offset在:" + metadata.offset());
                    System.out.println(exception.getMessage() + exception);
                }
            }
        });

        // 关闭produce
        kp.close();
    }
}*/