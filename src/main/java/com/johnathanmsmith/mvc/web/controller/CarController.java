package com.johnathanmsmith.mvc.web.controller;

import com.johnathanmsmith.mvc.web.config.WebMVCConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.validation.Valid;
import java.util.List;
import java.util.UUID;

/**
 * Created by piratXus on 08.06.2016.
        */




@Controller
public class CarController {
    private static final Logger logger = LoggerFactory.getLogger(WebMVCConfig.class);

    private CarTable ct;

    {
        ct = new CarTable();
    }

    @RequestMapping(value = "/", method = {RequestMethod.GET})
    public String main() {
        return "carMain";
    }


    @ResponseBody
    @RequestMapping(value = "/carMain/save", method = RequestMethod.POST, consumes = "application/json",
            produces = "application/json")
    public Car newCar(@Valid @RequestBody CarDTO carDTO) {
        ModelAndView model = new ModelAndView("carMain");
        CarService newCar = new CarService();
        model.addObject("ct", ct);
        Car car=new Car();
        car=newCar.transfer(carDTO);
        ct.setCar(car);

        return car;
    }


    @RequestMapping(value = "/carMain", method = {RequestMethod.GET})
    public String tableCar(ModelMap model) {

        model.put("ct", ct);
        return "carMain";
    }



    @ResponseBody
    @RequestMapping(value = "/editeCar", method = RequestMethod.POST, consumes = "application/json",
            produces = "application/json")
    public Car editeCar(@RequestBody CarService carEdite) {
        ModelAndView model = new ModelAndView("editeCar");
        List<Car> carList = ct.getCarTableList();
        Car car=new Car(UUID.fromString(carEdite.getId()),carEdite.getAge(),carEdite.getColor(),carEdite.getBrand());
        for(int i=0;i<carList.size();i++){
           if (carList.get(i).getId().equals(UUID.fromString(carEdite.getId()))){
               ct.setCar(car);
               ct.removeCar(i);
               model.addObject("ct", ct);
           }
        }
        return car;
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST, consumes = "application/json",
            produces = "application/json")
    public boolean deleteSCar(@RequestBody String id) {
        List<Car> carList = ct.getCarTableList();
        boolean flag = false;
        for (int i = 0; i < carList.size(); i++) {
            if (carList.get(i).getId().equals(UUID.fromString(id))) {
                ct.removeCar(i);
                flag = true;
                break;
            } else flag = false;

        }
        return flag;
    }


    @ResponseBody
    @RequestMapping(value = "/start", method = RequestMethod.GET, consumes = "application/json",
            produces = "application/json")
    public List<Car> getAllCars() {
        return ct.getCarTableList();
    }


}



