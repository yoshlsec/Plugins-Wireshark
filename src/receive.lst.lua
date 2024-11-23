local function main()
    local tw = TextWindow.new("Data Receive per IP")

    local bytes_sent = {}
    local tap = Listener.new()

    local function remove()
        tap:remove()
    end

    tw:set_atclose(remove) -- Call remove() to close the window

    local function format_bytes(bytes)
        if bytes >= 1073741824 then                         -- >= 1 GB
            return string.format("%.2f GB", bytes / 1073741824)
        elseif bytes >= 1048576 then                        -- >= 1 MB
            return string.format("%.2f MB", bytes / 1048576)
        elseif bytes >= 1024 then                           -- >= 1 KB
            return string.format("%.2f KB", bytes / 1024)
        else
            return bytes .. " B"                            -- Bytes
        end
    end

    function tap.packet(pinfo, tvb)
        local packet_length = tvb:len()
        local dst_ip = tostring(pinfo.dst)

        bytes_sent[dst_ip] = (bytes_sent[dst_ip] or 0) + packet_length
    end

    local function sorter()
        local sorted = {}
        for ip, bytes in pairs(bytes_sent) do
            table.insert(sorted, {ip = ip, bytes = bytes})
        end

        table.sort(sorted, function(a, b) return a.bytes > b.bytes end)
        return sorted
    end

    -- Refresh the window
    function tap.draw(t)
        tw:clear()
        tw:append("IP Address\t\tData Receive\n==============================================\n")

        local sorted_ips = sorter()
        for _, entry in ipairs(sorted_ips) do
            tw:append(entry.ip .. "\t\t" .. format_bytes(entry.bytes) .. "\n")
        end
    end

    function tap.reset()
        tw:clear()
        bytes_sent = {}
    end
    retap_packets()
end
register_menu("Receiver Sorter", main, MENU_TOOLS_UNSORTED)
