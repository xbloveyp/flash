package com.flash_editor.mapper;

import com.flash_editor.domain.FlashProject;
import com.flash_editor.domain.FlashProjectExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FlashProjectMapper {
    int countByExample(FlashProjectExample example);

    int deleteByExample(FlashProjectExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FlashProject record);

    int insertSelective(FlashProject record);

    List<FlashProject> selectByExampleWithBLOBs(FlashProjectExample example);

    List<FlashProject> selectByExample(FlashProjectExample example);

    FlashProject selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") FlashProject record, @Param("example") FlashProjectExample example);

    int updateByExampleWithBLOBs(@Param("record") FlashProject record, @Param("example") FlashProjectExample example);

    int updateByExample(@Param("record") FlashProject record, @Param("example") FlashProjectExample example);

    int updateByPrimaryKeySelective(FlashProject record);

    int updateByPrimaryKeyWithBLOBs(FlashProject record);

    int updateByPrimaryKey(FlashProject record);
}