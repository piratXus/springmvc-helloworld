package com.johnathanmsmith.mvc.web.controller;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;
import java.util.UUID;

/**
 * Created by piratXus on 13.06.2016.
 */
public class CarService {

    private String id;
    private String brand;
    private String color;
    private int age;

    public CarService(String id, String brand, String color, int age) {
        this.id = id;
        this.brand = brand;
        this.color = color;
        this.age = age;
    }

    @Override
    public String toString() {
        return "CarService{" +
                "id='" + id + '\'' +
                ", brand='" + brand + '\'' +
                ", color='" + color + '\'' +
                ", age=" + age +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public CarService(){};

    public Car transfer(CarDTO carDTO){
        return new Car(UUID.randomUUID(),carDTO.getAge(),carDTO.getColor(),carDTO.getBrand());
    }
}
