package com.flash_editor.mapper;

import com.flash_editor.domain.flashContent;
import com.flash_editor.domain.flashContentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface flashContentMapper {
    int countByExample(flashContentExample example);

    int deleteByExample(flashContentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(flashContent record);

    int insertSelective(flashContent record);

    List<flashContent> selectByExampleWithBLOBs(flashContentExample example);

    List<flashContent> selectByExample(flashContentExample example);

    flashContent selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") flashContent record, @Param("example") flashContentExample example);

    int updateByExampleWithBLOBs(@Param("record") flashContent record, @Param("example") flashContentExample example);

    int updateByExample(@Param("record") flashContent record, @Param("example") flashContentExample example);

    int updateByPrimaryKeySelective(flashContent record);

    int updateByPrimaryKeyWithBLOBs(flashContent record);

    int updateByPrimaryKey(flashContent record);
}