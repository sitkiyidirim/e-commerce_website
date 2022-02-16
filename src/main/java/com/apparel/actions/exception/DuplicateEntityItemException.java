package com.apparel.actions.exception;

public class DuplicateEntityItemException extends Exception {
	private static final long serialVersionUID = 4952390298437287493L;

    public DuplicateEntityItemException() {
    }

    public DuplicateEntityItemException(String arg0) {
        super(arg0);
    }

    public DuplicateEntityItemException(Throwable arg0) {
        super(arg0);
    }

    public DuplicateEntityItemException(String arg0, Throwable arg1) {
        super(arg0, arg1);
    }

    public DuplicateEntityItemException(String arg0, Throwable arg1, boolean arg2, boolean arg3) {
        super(arg0, arg1, arg2, arg3);
    }
}
