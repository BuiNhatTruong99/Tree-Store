package com.poly.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Chart implements Serializable{ // Create this Entity to get data from sub Query
	@Id
	Integer date;
	double total;
	Integer year;
}
