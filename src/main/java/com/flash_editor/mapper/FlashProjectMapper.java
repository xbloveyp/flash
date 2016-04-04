package com.flash_editor.mapper;

import com.flash_editor.domain.FlashProject;
import com.flash_editor.domain.FlashProjectExample;
import com.flash_editor.domain.FlashProjectWithBLOBs;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FlashProjectMapper {
    int countByExample(FlashProjectExample example);

    int deleteByExample(FlashProjectExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FlashProjectWithBLOBs record);

    int insertSelective(FlashProjectWithBLOBs record);

    List<FlashProjectWithBLOBs> selectByExampleWithBLOBs(FlashProjectExample example);

    List<FlashProject> selectByExample(FlashProjectExample example);

    FlashProjectWithBLOBs selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") FlashProjectWithBLOBs record, @Param("example") FlashProjectExample example);

    int updateByExampleWithBLOBs(@Param("record") FlashProjectWithBLOBs record, @Param("example") FlashProjectExample example);

    int updateByExample(@Param("record") FlashProject record, @Param("example") FlashProjectExample example);

    int updateByPrimaryKeySelective(FlashProjectWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(FlashProjectWithBLOBs record);

    int updateByPrimaryKey(FlashProject record);
}