<?php
/**
 *
 */

class Category
{
    protected $data_file;
    protected $db;


    function __construct()
    {
        $this->db = new Model();
    }

//
    public function all($parent = '')
    {
        $sql = "select * from categories";
        if ($parent != '')
            $sql = "select * from categories where category_parents like '%" . $parent . "%'";
        return $this->db->query($sql);
    }

//

    public function find($id)
    {
        return $this->db->query("select * from categories2 WHERE id =$id");
    }

    public function mainCategories($aData)
    {

        $likeVar = "%" . $aData . "%";

        $oStmt = $this->db->preparation('SELECT category_id ,category_name FROM categories WHERE category_name  LIKE  and category_name  LIKE  ?  ');
        $oStmt->execute(array(0 => $likeVar));
        return $oStmt->fetchAll();

    }


    public function add(array $aData)
    {

        $oStmt = $this->db->preparation('INSERT INTO categories (  category_name, category_description, category_parents)
                                                  VALUES (  :category_name, :category_description, :category_parents)');
        $oStmt->execute($aData);
        return $this->db->lastInsertId();

    }

    public function update(array $aData)
    {

        $oStmt = $this->db->preparation('update  categories2 set name_ar =:name_ar, name_en=:name_en, parent=:parent, liveNews=:liveNews,
                                                    newsCount=:newsCount,sort=:sort,  section_count=:section_count,
                                                    isMain=:isMain,hasSlides=:hasSlides,  sort=:sort,
                                                 status=:status, updates=:updates, updated_at=:updated_at where id=:id
                                                  ');
        return $oStmt->execute($aData);

    }


    public function delete($id)
    {
        $counter = DB::init()->query("SELECT COUNT(*) AS count FROM categories2 WHERE parent= $id ");


        if ($counter[0]['count'] > 0)
            return "hasChild";


        $oStmt = $this->db->preparation('delete from  categories2  WHERE id LIKE  ? ');
        return $oStmt->execute(array(0 => $id));
//        return $oStmt->execute($aData);

    }

    public function activeByAdmin(array $aData)
    {
//        return var_dump($aData);
        $oStmt = $this->db->preparation('update  categories set category_status =:category_status where category_id=:category_id');
        return $oStmt->execute($aData);

    }
    public function visibility(array $aData)
    {
//        return var_dump($aData);
        $oStmt = $this->db->preparation('update  categories set category_visibility =:category_visibility where category_id=:category_id');
        return $oStmt->execute($aData);

    }

}


?>
