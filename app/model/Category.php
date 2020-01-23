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
    public function all()
    {
        return $this->db->query("select * from categories2");
    }

//

    public function find($id)
    {
        return $this->db->query("select * from categories2 WHERE id =$id");
    }

    public function mainCategories($aData)
    {

        $likeVar = "%" . $aData . "%";

        $oStmt = $this->db->preparation('SELECT id ,name_ar FROM categories2 WHERE name_ar LIKE  ?  and isMain=1 and parent=0');
        $oStmt->execute(array(0 => $likeVar));
        return $oStmt->fetchAll();

    }


    public function add(array $aData)
    {

        $oStmt = $this->db->preparation('INSERT INTO categories2 (  name_ar, name_en, parent, liveNews, newsCount, section_count, isMain, hasSlides, sort, status,
                                                    created_by, updates, created_at, updated_at)
                                                  VALUES (  :name_ar, :name_en, :parent, :liveNews, :newsCount, :section_count, 
                                                  :isMain, :hasSlides, :sort, :status,:created_by, :updates, :created_at, :updated_at)');
        return $oStmt->execute($aData);

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


}


?>
