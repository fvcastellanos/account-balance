package net.cavitos.balance.model.dao;

import net.cavitos.balance.domain.TransactionType;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface TransactionTypeDao {

    @Select("SELECT * FROM transaction_type")
    @Results({
            @Result(property = "id", column = "id"),
            @Result(property = "name", column = "name"),
            @Result(property = "credit", column = "credit"),
    })
    List<TransactionType> getTransactionTypes();

    @Select("SELECT * FROM transaction_type WHERE id = #{id}")
    TransactionType getTransactionType(@Param("id") Long id);

    @Select("select * from transaction_type where name = #{name}")
    TransactionType getTransactionTypeByName(@Param("name") String name);

    @Insert("insert into transaction_type (name, credit) values (#{name}, #{isCredit})")
    void addTransactionType(@Param("name") String name, @Param("isCredit") boolean isCredit);

    @Insert("insert into transaction_type values (#{id}, #{name}, #{isCredit})")
    void addTransactionTypeWithId(@Param("id") Long id, @Param("name") String name, @Param("isCredit") boolean isCredit);

    @Delete("delete from transaction_type where id = #{id}")
    void deleteTransactionType(@Param("id") Long id);
}
