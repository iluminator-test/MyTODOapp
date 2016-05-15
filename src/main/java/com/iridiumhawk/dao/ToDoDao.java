package com.iridiumhawk.dao;

import com.iridiumhawk.entity.ToDo;

import java.util.List;

/**
 * Created by hawk on 09.05.2016.
 */

public interface ToDoDao {

    ToDo findById(Integer id);

    List<ToDo> findAllNotes();

    void saveNote(ToDo note);

    void deleteNote(Integer id);

    List<ToDo> findByNote(String search);

    List<ToDo> findByDate(String search);

}