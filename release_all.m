function [ ] = release_all( key )
    key.keyRelease(java.awt.event.KeyEvent.VK_LEFT);
    key.keyRelease(java.awt.event.KeyEvent.VK_RIGHT);
    key.keyRelease(java.awt.event.KeyEvent.VK_UP);
end