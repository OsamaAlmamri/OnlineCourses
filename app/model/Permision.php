<?php
/**
 *
 */

class Permision
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
        $sql = "select * from permissions";
        return $this->db->query($sql);
    }

//

    public function getPermissionCategoryByName($name)
    {

        return $this->db->query("select * from permissions WHERE permission_name  like '" . $name . "_%' ");

    }

    public function getPermissionByName($name)
    {
        $id = $this->db->fetchOne("select permission_id from permissions WHERE permission_name  like '" . $name . "' ");
        if ($id == false)
            return 0;
        return ($id['permission_id']);
    }


    public function find($id)
    {
        return $this->db->query("select * from permissions WHERE id =$id");
    }


    public function add(array $aData)
    {
        $oStmt = $this->db->preparation('INSERT INTO permissions ( permission_name, permissions_description,permission_status)
                                                  VALUES (:permission_name, :permissions_description,0)');

        return $oStmt->execute($aData);

    }

//    public function update(array $aData)
//    {
//
//        $oStmt = $this->db->preparation('update  permission_id set name_ar =:name_ar, name_en=:name_en, parent=:parent, liveNews=:liveNews,
//                                                    newsCount=:newsCount,sort=:sort,  section_count=:section_count,
//                                                    isMain=:isMain,hasSlides=:hasSlides,  sort=:sort,
//                                                 status=:status, updates=:updates, updated_at=:updated_at where id=:id
//                                                  ');
//        return $oStmt->execute($aData);
//
//    }


    public function delete($id)
    {
        $counter = DB::init()->query("SELECT COUNT(*) AS count FROM permissions WHERE permission_id= $id ");


        $oStmt = $this->db->preparation('delete from  permissions  WHERE permission_id LIKE  ? ');
        return $oStmt->execute(array(0 => $id));
//        return $oStmt->execute($aData);

    }

    public function activePermisionByAdmin(array $aData)
    {
//        return var_dump($aData);
        $oStmt = $this->db->preparation('update  permissions set permission_status =:permission_status where permission_id=:permission_id');
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
