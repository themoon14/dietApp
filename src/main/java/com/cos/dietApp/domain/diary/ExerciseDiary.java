package com.cos.dietApp.domain.diary;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.cos.dietApp.domain.user.User;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ExerciseDiary {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int 	id;
	private String 	Exercise;
	private String 	kcal;
	private String 	file;
	private String 	time; // 운동시간
	private String 	date; // 운동한 날짜
	
	@JoinColumn(name = "userId")
	@ManyToOne(fetch = FetchType.EAGER) 
	private User user;
	
}
