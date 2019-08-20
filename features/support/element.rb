module Element
  def self.get(type, value)
    start = Time.new
    while Time.new - start < 20
      begin
        el = $driver.find_element(type, value)
        p "Found, type: #{type}, value: #{value}"
        return el
      rescue
        p "Retrying, type: #{type}, value: #{value}"
        sleep(0.2)
      end
    end
    raise "Failed to find element, type: #{type}, value: #{value}"
  end

  def self.check_if_visible(type, value, timer: 3)
    start = Time.new
    while Time.new - start < timer
      begin
        el = $driver.find_element(type, value)
        p "Found, type: #{type}, value: #{value}"
        return true
      rescue
        p "Retrying, type: #{type}, value: #{value}"
        sleep(0.2)
      end
    end
    return false
  end

  def self.click(type, value)
    el = get(type, value)
    el.click
  end

  def self.get_list(type, value)
      start = Time.new
      while Time.new - start < 20
        begin
          el_list = $driver.find_elements(type, value)
          raise "Element list is empty!" if el_list.empty?
          p "Found element list, type: #{type}, value: #{value}"
          return el_list
        rescue
          p "Retrying, type: #{type}, value: #{value}"
          sleep(0.2)
        end
      end
      raise "Failed to find element, type: #{type}, value: #{value}"
    end

  def self.set(type, value, text)
    el = get(type, value)
    el.send_keys(text)
    $driver.hide_keyboard if $driver.is_keyboard_shown
  end

  def self.validate_if_invisible(type, value, timer: 5)
    start = Time.new
    while Time.new - start < timer
      begin
        $driver.find_element(type, value)
        p "Element still visible, type: #{type}, value: #{value}"
      rescue
        p "Element was not found, success! type: #{type}, value: #{value}"
        return
      end
      sleep(0.2)
    end
    raise "Element still visible, type: #{type}, value: #{value}"
  end


  def self.get_screen_sizes
    #screen = $driver.window_size #hah no such method you know :@@@@
    screen = $driver.window_size
    sizes = {
      width: screen.width,
      height: screen.height,
      from: screen.height - (screen.height / 4),
      to: screen.height / 4,
      middle: screen.width / 2,
      duration: 1500
    }
    return sizes
  end

  def self.scroll_down(screen_hash)
      $driver.swipe(start_x: screen_hash[:middle], start_y: screen_hash[:from], end_x: screen_hash[:middle], end_y: screen_hash[:to], duration: screen_hash[:duration])
  end

end
