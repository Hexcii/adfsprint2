package com.citonline.exceptions;

public class FileTypeException  extends RuntimeException{
	
	private static final long serialVersionUID = 1L;

	public FileTypeException(String message) {
	    super(message);
	  }
	  
	  public FileTypeException(String message, Throwable cause) {
	    super(message, cause);
	  }

} 