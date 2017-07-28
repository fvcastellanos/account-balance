package net.cavitos.balance.web.controller;

import net.cavitos.balance.domain.Response;

public abstract class BaseController {

    public static final String OK = "OK";
    public static final String ERROR = "ERROR";

    private Response buildResponse(String code, String message, Object payload) {
        Response response = Response.newBuilder()
                .withCode(code)
                .withMessage(message)
                .withPayLoad(payload)
                .build();

        return response;
    }

    protected Response buildSuccessResponse(Object payload) {
        return buildResponse(OK, "", payload);
    }

    protected Response buildExceptionResponse(Exception ex) {
        return buildResponse(ERROR, ex.getMessage(), ex);
    }
}
