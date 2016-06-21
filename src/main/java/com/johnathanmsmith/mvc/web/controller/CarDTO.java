package com.johnathanmsmith.mvc.web.controller;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * Created by piratXus on 13.06.2016.
 */
public class CarDTO {
    @NotEmpty
    @Size(min=2, max=20)
    private String brand;
    @NotEmpty
    @Size(min=3, max= 15)
    private String color;
    @NotNull
    @Min(1)
    @Max(210)
    private int age;

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

    public CarDTO(){};

    public CarDTO(String brand, String color, int age) {
        this.brand = brand;
        this.color = color;
        this.age = age;
    }

    @Override
    public String toString() {
        return "CarService{" +
                "brand='" + brand + '\'' +
                ", color='" + color + '\'' +
                ", age=" + age +
                '}';
    }
}
