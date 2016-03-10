package com.flash_editor.service;

import com.flash_editor.domain.Library;
import com.flash_editor.domain.LibraryExample;
import com.flash_editor.domain.LibraryWithBLOBs;
import com.flash_editor.mapper.LibraryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2016/3/10.
 */
@Service
public class LibraryService {
    @Autowired
    private LibraryMapper libraryMapper;

    public void insert(LibraryWithBLOBs library){
        libraryMapper.insert(library);
    }

    public Library getById(int id){
       return libraryMapper.selectByPrimaryKey(id);
    }

    public LibraryWithBLOBs getByName(String name){
        LibraryExample libraryExample = new LibraryExample();
        libraryExample.createCriteria().andNameEqualTo(name);
        return libraryMapper.selectByExampleWithBLOBs(libraryExample).get(0);
    }
}
