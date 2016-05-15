package com.iridiumhawk.dao;

import com.iridiumhawk.entity.ToDo;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.joda.time.LocalDate;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by hawk on 09.05.2016.
 */

@Repository("ToDoDao")
public class ToDoDaoImpl extends AbstractDao<Integer, ToDo> implements ToDoDao {

    public ToDo findById(Integer id) {
        return getByKey(id);
    }

    public void saveNote(ToDo note) {
        persist(note);
    }

    public void deleteNote(Integer id) {
        Query query = getSession().createSQLQuery("delete from todo where id = :id");
        query.setInteger("id", id);
        query.executeUpdate();
    }

    @SuppressWarnings("unchecked")
    public List<ToDo> findAllNotes() {
        Criteria criteria = createEntityCriteria();
        return (List<ToDo>) criteria.list();
    }

    public List<ToDo> findByNote(String search)  {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.like("note","%"+search+"%"));

        return  criteria.list();
    }

    public List<ToDo> findByDate(String search){
      /*Locale locale = java.util.Locale.US;*/

        LocalDate dateLocal = LocalDate.parse(search);


        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("beginDate",dateLocal));
//        criteria.add(Restrictions.eq("endDate",dateLocal));

        return  criteria.list();
    }
}

