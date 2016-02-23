package com.flash_editor.mapper;

import com.flash_editor.domain.FlashContent;
import com.flash_editor.domain.FlashContentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FlashContentMapper {
    int countByExample(FlashContentExample example);

    int deleteByExample(FlashContentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FlashContent record);

    int insertSelective(FlashContent record);

    List<FlashContent> selectByExampleWithBLOBs(FlashContentExample example);

    List<FlashContent> selectByExample(FlashContentExample example);

    FlashContent selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") FlashContent record, @Param("example") FlashContentExample example);

    int updateByExampleWithBLOBs(@Param("record") FlashContent record, @Param("example") FlashContentExample example);

    int updateByExample(@Param("record") FlashContent record, @Param("example") FlashContentExample example);

    int updateByPrimaryKeySelective(FlashContent record);

    int updateByPrimaryKeyWithBLOBs(FlashContent record);

    int updateByPrimaryKey(FlashContent record);
}