<?php
/**
 *
 */

class Course
{

    protected $db;

    function __construct()
    {
        $this->db = new Model();
    }

// return all row of table of courses
    public function all()
    {
        return $this->db->query("select * from courses");
    }

    public function page($id)
    {
        return $this->db->query("select * from courses where categories2 like '%\"$id\"%' ");
    }

    public function find($id)
    {
//        $oStmt = $this->db->preparation('SELECT * FROM courses WHERE id =$id');
        return $this->db->query("select * from courses WHERE id =$id");
//        $oStmt->execute($aData);
//        return $oStmt->fetch();

    }


    public function add(array $aData)
    {

        $oStmt = $this->db->preparation('INSERT INTO courses (  categories2, editor, title, introduction, logo,sort,  has_comment,
                                                 status, created_by, updates, created_at, updated_at)
                                                  VALUES (  :categories2, :editor, :title, :introduction, :logo,:sort, :has_comment, 
                                                  :status,:created_by, :updates, :created_at, :updated_at)');
        return $oStmt->execute($aData);

    }


    public function update(array $aData)
    {

        $oStmt = $this->db->preparation('update  courses set categories2 =:categories2, editor=:editor, title=:title, introduction=:introduction, logo=:logo,sort=:sort,  has_comment=:has_comment,
                                                 status=:status, updates=:updates, updated_at=:updated_at where id=:id
                                                  ');
        return $oStmt->execute($aData);

    }


    public function findCategory($aData)
    {
        $oStmt = $this->db->preparation('SELECT * FROM courses WHERE category =?');
        $oStmt->execute($aData);
        return $oStmt->fetchAll();

    }

//add new row to courses table

    public function delete($id)
    {

        $oStmt = $this->db->preparation('delete from  courses  WHERE id LIKE  ? ');
        return $oStmt->execute(array(0 => $id));
//        return $oStmt->execute($aData);

    }
}


?>
