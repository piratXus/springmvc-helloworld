package com.johnathanmsmith.mvc.web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by piratXus on 09.06.2016.
 */
public class CarTable {
private List<Car> carTableList =new ArrayList<Car>();



    public List<Car> getCarTableList() {
        return carTableList;
    }

    public void setCarTableList(List<Car> carTableList) {
        this.carTableList = carTableList;
    }

    public void removeCar(int index){

        carTableList.remove(index);
    }

    public void addNewCar(Car newCar){this.carTableList.add(newCar);}

    public void setCar( Car car){
        carTableList.add(car);
    }


}
