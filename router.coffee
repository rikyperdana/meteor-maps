Router.configure
    layoutTemplate: 'layout'

Router.route '/',
    action: -> this.render 'home'
