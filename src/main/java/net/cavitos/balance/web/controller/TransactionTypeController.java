package net.cavitos.balance.web.controller;

import com.google.common.collect.Lists;
import net.cavitos.balance.service.TransactionTypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@RestController
@RequestMapping(value = "/transaction-type")
public class TransactionTypeController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private TransactionTypeService transactionTypeService;

    @ResponseBody
    @RequestMapping(value = "/test", method = GET)
    public List<String> test() {
        return Lists.newArrayList("hola", "mundo");
    }
/*
    @RequestMapping(value = "/get", method = GET)
    @ResponseBody
    public List<TransactionType> getTransactionTypes() {
        return transactionTypeService.getTransactionTypes();
    }

    @RequestMapping(value = "/get/{id}", method = GET)
    @ResponseBody
    public TransactionType getTransactionType(@PathVariable  Long id) throws Exception {
        Optional<TransactionType> transactionTypeWrapper = transactionTypeService.getTransactionType(id);
        if(transactionTypeWrapper.isPresent()) {
            return transactionTypeWrapper.get();
        }

        throw new NotFoundException();
    }

    @RequestMapping(value = "/add", method = PUT)
    public ResponseEntity addTransactionType(@RequestBody TransactionType transactionType) throws Exception {
        logger.info("Creating a new transaction type");
    	if(transactionType != null) {
    		Result result = transactionTypeService.newTransactionType(transactionType.getName(), transactionType.getCredit());
            if(result.isSuccess()) {
                logger.info("Transaction type created");
                return new ResponseEntity(HttpStatus.ACCEPTED);
            } else {
                logger.error("Unable to create transaction type", result.getException());
                throw result.getException();
            }
        } else {
            throw new Exception("Transaction type [name, is_credit] expected");
        }
    }
*/
}
