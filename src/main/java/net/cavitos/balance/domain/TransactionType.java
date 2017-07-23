package net.cavitos.balance.domain;

public class TransactionType {

    private Long id;
    private String name;
    private Boolean credit;

    public TransactionType() {
        super();
    }

    public TransactionType(final Long id, final String name, final Boolean credit) {
        this.id = id;
        this.name = name;
        this.credit = credit;
    }

    private TransactionType(final Builder builder) {
        id = builder.id;
        name = builder.name;
        credit = builder.credit;
    }

    public static Builder newBuilder() {
        return new Builder();
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Boolean getCredit() {
        return credit;
    }

    public static final class Builder {
        private Long id;
        private String name;
        private Boolean credit;

        private Builder() {
        }

        public Builder withId(final Long val) {
            id = val;
            return this;
        }

        public Builder withName(final String val) {
            name = val;
            return this;
        }

        public Builder withCredit(final Boolean val) {
            credit = val;
            return this;
        }

        public TransactionType build() {
            return new TransactionType(this);
        }
    }
}
