Locales = {}

function _(str, ...)
    if Locales[fivem_roleplay_core._language] ~= nil then
        if Locales[fivem_roleplay_core._language][str] ~= nil then
            return string.format(Locales[fivem_roleplay_core._language][str], ...)
        else
            return 'Translation [' .. fivem_roleplay_core._language .. '][' .. str .. '] does not exist'
        end
    else
        return 'Locale [' .. fivem_roleplay_core._language .. '] does not exist'
    end
end

function _L(str, ...)
    return tostring(_(str, ...):gsub("^%l", string.upper))
end