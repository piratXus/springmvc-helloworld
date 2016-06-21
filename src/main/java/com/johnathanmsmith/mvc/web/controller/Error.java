package com.johnathanmsmith.mvc.web.controller;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * Created by piratXus on 20.06.2016.
 */
public class Error {
    private List<String> errors;

    public Error() {
    }

    public Error(List<String> errors) {
        this.errors = errors;
    }

    public Error(String error) {
        this(Collections.singletonList(error));
    }

    public Error(String ... errors) {
        this(Arrays.asList(errors));
    }

    public List<String> getErrors() {
        return errors;
    }

    public void setErrors(List<String> errors) {
        this.errors = errors;
    }


}
