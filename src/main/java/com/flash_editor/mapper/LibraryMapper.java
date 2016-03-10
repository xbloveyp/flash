package com.flash_editor.mapper;

import com.flash_editor.domain.Library;
import com.flash_editor.domain.LibraryExample;
import com.flash_editor.domain.LibraryWithBLOBs;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface LibraryMapper {
    int countByExample(LibraryExample example);

    int deleteByExample(LibraryExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(LibraryWithBLOBs record);

    int insertSelective(LibraryWithBLOBs record);

    List<LibraryWithBLOBs> selectByExampleWithBLOBs(LibraryExample example);

    List<Library> selectByExample(LibraryExample example);

    LibraryWithBLOBs selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") LibraryWithBLOBs record, @Param("example") LibraryExample example);

    int updateByExampleWithBLOBs(@Param("record") LibraryWithBLOBs record, @Param("example") LibraryExample example);

    int updateByExample(@Param("record") Library record, @Param("example") LibraryExample example);

    int updateByPrimaryKeySelective(LibraryWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(LibraryWithBLOBs record);

    int updateByPrimaryKey(Library record);
}