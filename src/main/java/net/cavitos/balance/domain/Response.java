package net.cavitos.balance.domain;

/**
 * Created by fvcg2 on 9/07/2016.
 */
public class Response {
    private String code;
    private String message;
    private Object payLoad;

    private Response(Builder builder) {
        code = builder.code;
        message = builder.message;
        payLoad = builder.payLoad;
    }

    public static Builder newBuilder() {
        return new Builder();
    }

    public String getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }

    public Object getPayLoad() {
        return payLoad;
    }


    public static final class Builder {
        private String code;
        private String message;
        private Object payLoad;

        private Builder() {
        }

        public Builder withCode(String val) {
            code = val;
            return this;
        }

        public Builder withMessage(String val) {
            message = val;
            return this;
        }

        public Builder withPayLoad(Object val) {
            payLoad = val;
            return this;
        }

        public Response build() {
            return new Response(this);
        }
    }
}
