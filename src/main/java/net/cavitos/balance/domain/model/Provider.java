package net.cavitos.balance.domain.model;

import org.springframework.data.annotation.Id;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@EqualsAndHashCode
public class Provider {

    @Id
    private long id;
    private String name;
    private String country;
    private String tenant;
}
