import dracula.draw

# Load existing settings made via :set
config.load_autoconfig()

# c.qt.args = ['blink-settings=darkMode=4,darkModeImagePolicy=2']
config.set("colors.webpage.darkmode.enabled", True)

default_font_family = 'TerminessTTFNerdFontMono'
default_font_size = '11pt'

c.fonts.default_family = default_font_family
c.fonts.default_size = default_font_size
c.fonts.prompts = f'{default_font_size} {default_font_family}'

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 2,
        'horizontal': 4
    }
})

"""Block YT ads.

I DO NOT USE THIS SCRIPT ANYMORE, in favor of a real adblocker."""


from qutebrowser.api import interceptor


def filter_yt(info: interceptor.Request):
	"""Block the given request if necessary."""
	url = info.request_url
	if (url.host() == 'www.youtube.com' and
			url.path() == '/get_video_info' and
			'&adformat=' in url.query()):
		info.block()


interceptor.register(filter_yt)

config.unbind('<Ctrl-W>') 
config.bind('<Ctrl-w>', 'fake-key <Ctrl-backspace>', mode='insert')

# c.input.spatial_navigation = True
