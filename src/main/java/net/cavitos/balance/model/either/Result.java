package net.cavitos.balance.model.either;

/**
 * Created by fvcg2 on 9/10/2016.
 */
public class Result {
    private boolean isSuccess;
    private Object object;
    private Exception ex;

    private Result(Object object) {
        this.isSuccess = true;
        this.object = object;
        this.ex = null;
    }

    private Result(Exception ex) {
        this.ex = ex;
        this.isSuccess = false;
        this.object = null;
    }

    public static Result forSuccess(Object object) {
        return new Result(object);
    }

    public static Result forException(Exception ex) {
        return new Result(ex);
    }

    public <T> T getObject() {
        return (T) this.object;
    }

    public Exception getException() {
        return this.ex;
    }

    public boolean isSuccess() {
        return this.isSuccess;
    }

}
