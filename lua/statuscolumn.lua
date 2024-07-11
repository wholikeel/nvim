local statuscolumn = {};

statuscolumn.setHl = function()
    local colors = {
        "#caa6f7",
        "#c1a6f1",
        "#b9a5ea",
        "#b1a4e4",
        "#aba3dc",
        "#a5a2d4",
        "#9fa0cc",
        "#9b9ec4",
        "#979cbc",
        "#949ab3"
    };

    for i, color in ipairs(colors) do
        vim.api.nvim_set_hl(0, "Gradient_" .. i, { fg = color });
    end
end

statuscolumn.number = function (user_config)

    local text = "";

    local config = vim.tbl_extend("keep", user_config or {}, {
        colors = nil,
        mode = "relative"
    });

    if config.colors ~= nil and vim.islist(config.colors) then
        for rel_numb, hl in ipairs(config.colors) do
            if (vim.v.relnum + 1) == rel_numb then
                text = "%#" .. hl .. "#";
                break;
            end
        end

        if text == "" then
            text = "%#" .. config.colors[#config.colors] .. "#";
        end
    end

    if config.mode == "normal" then
        return text .. vim.v.lnum;
    elseif config.mode == "relative" then
        return text .. vim.v.relnum;
    elseif config.mode == "hybrid" then
        return vim.v.relnum == 0 and text .. vim.v.lnum or text .. vim.v.relnum;
    end

    return text;
end

statuscolumn.border = function()
    if vim.v.relnum < 9 then
        return "%#Gradient_" .. (vim.v.lnum + 1) .. "#│";
    else
        return "%#Gradient_10#│";
    end
end

statuscolumn.myStatuscolumn = function()
    local text = "";

    statuscolumn.setHl();

    text = table.concat {
        statuscolumn.border();
        statuscolumn.number({ mode = "relative" })
    };

    return text;
end



return statuscolumn;
