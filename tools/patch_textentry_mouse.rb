# encoding: UTF-8
path = "tools/_dump_UI_TextEntry.clean.rb"
src = File.read(path, encoding: "UTF-8")

old_block = <<'OLD'
  def pbEntry
    ret = ""
    loop do
      Graphics.update
      Input.update
      pbUpdate
      next if pbMoveCursor
      if Input.trigger?(Input::SPECIAL)
        pbChangeTab
      elsif Input.trigger?(Input::ACTION)
        @cursorpos = OK
        @sprites["cursor"].setCursorPos(@cursorpos)
      elsif Input.trigger?(Input::BACK)
        @helper.delete
        pbPlayCancelSE
        pbUpdateOverlay
      elsif Input.trigger?(Input::USE)
        case @cursorpos
        when BACK   # Backspace
          @helper.delete
          pbPlayCancelSE
          pbUpdateOverlay
        when OK     # Done
          pbSEPlay("GUI naming confirm")
          if @helper.length >= @minlength
            ret = @helper.text
            break
          end
        when MODE1
          pbChangeTab(0) if @mode != 0
        when MODE2
          pbChangeTab(1) if @mode != 1
        when MODE3
          pbChangeTab(2) if @mode != 2
        when MODE4
          pbChangeTab(3) if @mode != 3
        else
          cursormod = @cursorpos % ROWS
          cursordiv = @cursorpos / ROWS
          charpos = (cursordiv * ROWS) + cursormod
          chset = @@Characters[@mode][0]
          @helper.delete if @helper.length >= @maxlength
          @helper.insert(chset[charpos])
          pbPlayCursorSE
          if @helper.length >= @maxlength
            @cursorpos = OK
            @sprites["cursor"].setCursorPos(@cursorpos)
          end
          pbUpdateOverlay
          # Auto-switch to lowercase letters after the first uppercase letter is selected
          pbChangeTab(1) if @mode == 0 && @helper.cursor == 1
        end
      end
    end
    Input.update
    return ret
  end
OLD

new_block = <<'NEW'
  # Performs the action for whatever is currently under @cursorpos (a letter,
  # BACK, OK or a mode tab). Returns the finished text if entry is complete,
  # or nil otherwise. Shared by keyboard/pad confirm and mouse/touch clicks.
  def pbActivateCurrent
    case @cursorpos
    when BACK   # Backspace
      @helper.delete
      pbPlayCancelSE
      pbUpdateOverlay
    when OK     # Done
      pbSEPlay("GUI naming confirm")
      return @helper.text if @helper.length >= @minlength
    when MODE1
      pbChangeTab(0) if @mode != 0
    when MODE2
      pbChangeTab(1) if @mode != 1
    when MODE3
      pbChangeTab(2) if @mode != 2
    when MODE4
      pbChangeTab(3) if @mode != 3
    else
      cursormod = @cursorpos % ROWS
      cursordiv = @cursorpos / ROWS
      charpos = (cursordiv * ROWS) + cursormod
      chset = @@Characters[@mode][0]
      @helper.delete if @helper.length >= @maxlength
      @helper.insert(chset[charpos])
      pbPlayCursorSE
      if @helper.length >= @maxlength
        @cursorpos = OK
        @sprites["cursor"].setCursorPos(@cursorpos)
      end
      pbUpdateOverlay
      # Auto-switch to lowercase letters after the first uppercase letter is selected
      pbChangeTab(1) if @mode == 0 && @helper.cursor == 1
    end
    return nil
  end

  # Maps a mouse/touch position (in game screen coordinates) to a cursor
  # position (a letter index, or BACK/OK/MODE1-4), or nil if the click
  # landed on nothing clickable. Coordinates mirror NameEntryCursor#updateCursorPos.
  def pbMouseToCursorPos(mx, my)
    buttons = {
      MODE1 => [44, 120], MODE2 => [106, 120], MODE3 => [168, 120],
      MODE4 => [230, 120], BACK => [314, 120], OK => [394, 120]
    }
    buttons.each do |pos, (bx, by)|
      return pos if mx.between?(bx - 22, bx + 22) && my.between?(by - 18, by + 18)
    end
    gridleft = 52 - 16
    gridtop = 180 - 19
    gridright = 52 + (32 * (ROWS - 1)) + 16
    gridbottom = 180 + (38 * (COLUMNS - 1)) + 19
    if mx.between?(gridleft, gridright) && my.between?(gridtop, gridbottom)
      col = ((mx - gridleft) / 32).to_i.clamp(0, ROWS - 1)
      row = ((my - gridtop) / 38).to_i.clamp(0, COLUMNS - 1)
      pos = (row * ROWS) + col
      chset = @@Characters[@mode][0]
      return pos if pos < chset.length && chset[pos] != " "
    end
    return nil
  end

  def pbEntry
    ret = ""
    loop do
      Graphics.update
      Input.update
      pbUpdate
      if Input.trigger?(Input::MOUSELEFT)
        mousepos = Mouse.getMousePos
        if mousepos
          hit = pbMouseToCursorPos(mousepos[0], mousepos[1])
          if hit
            if hit != @cursorpos
              @cursorpos = hit
              @sprites["cursor"].setCursorPos(@cursorpos)
              pbPlayCursorSE
            end
            result = pbActivateCurrent
            if result
              ret = result
              break
            end
          end
        end
        next
      end
      next if pbMoveCursor
      if Input.trigger?(Input::SPECIAL)
        pbChangeTab
      elsif Input.trigger?(Input::ACTION)
        @cursorpos = OK
        @sprites["cursor"].setCursorPos(@cursorpos)
      elsif Input.trigger?(Input::BACK)
        @helper.delete
        pbPlayCancelSE
        pbUpdateOverlay
      elsif Input.trigger?(Input::USE)
        result = pbActivateCurrent
        if result
          ret = result
          break
        end
      end
    end
    Input.update
    return ret
  end
NEW

raise "OLD block not found" unless src.include?(old_block)
count = src.scan(old_block).length
raise "expected exactly 1 match, got #{count}" if count != 1

src = src.sub(old_block, new_block)
File.write(path, src, encoding: "UTF-8")
puts "OK: patched #{path}"
