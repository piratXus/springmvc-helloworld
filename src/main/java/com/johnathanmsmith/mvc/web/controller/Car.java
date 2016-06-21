package com.johnathanmsmith.mvc.web.controller;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.Entity;
import java.util.UUID;

/**
 * Created by piratXus on 09.06.2016.
 */
@Entity
public class Car {

    private UUID id;
    private int age;
    private String color;
    private String brand;

    public UUID getId(){return id;}
    public void setId(UUID id){this.id=id;}
    public int getAge(){return age;}
    public void setAge(int age){this.age=age;}
    public String getColor(){return color;}
    public void setColor(String color){this.color=color;}
    public String getBrand(){return brand;}
    public void setBrand(String brand){this.brand=brand;}

    public Car(){};
    public Car(UUID id, int age, String color, String brand){
        this.id=id;
        this.age=age;
        this.color=color;
        this.brand=brand;
    }

    @Override
    public String toString(){
        return "age"+age+", color"+color+", brand"+brand + ", id"+id;
    }

}
