package net.cavitos.balance.web.controller;

import net.cavitos.balance.web.exception.NotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * Created by fvcg2 on 10/07/2016.
 */

@ControllerAdvice
public class ExceptionController {

    @ExceptionHandler(Exception.class)
    @ResponseStatus(value = HttpStatus.EXPECTATION_FAILED, reason = "Unhandled exception")
    public void unhandledException() {

    }

    @ExceptionHandler(NotFoundException.class)
    @ResponseStatus(value = HttpStatus.NOT_FOUND, reason = "Resource not found")
    public void notFoundException() {

    }
}
