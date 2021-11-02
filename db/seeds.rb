# require 'pp'
# users = [
#     {
#     email: 'joy@gmail.com',
#     username: 'joythecreator_',
#     name: 'JOY',
#     password: 'password',
#     password_confirmation: 'password',
#     io: {
#         avi: './app/assets/images/avi/joy.jpg',
#         bg:'./app/assets/images/bg/joybg.jpg'
#     },
#     filename: {
#         avi: 'joy.jpg',
#         bg: 'joybg.jpg'
#     },
#     content_type: {
#         avi: 'image/jpg',
#         bg: 'image/jpg'
#     }

#     },
#     {
#     email: 'ky@gmail.com',
#     username:  'halykykyk_',
#     name: 'glomez',
#     password: 'password',
#     password_confirmation: 'password',
#     io: {
#         avi: './app/assets/images/avi/ky.jpg',
#         bg:'./app/assets/images/bg/kybg.jpg'
#     },
#     filename: {
#         avi: 'ky.jpg',
#         bg: 'kybg.jpg'
#     },
#     content_type: {
#         avi: 'image/jpg',
#         bg: 'image/jpg'
#     }
#     },
#     {
#     email: 'leeko@gmail.com',
#     username: 'WholeLottaLeek',
#     name: 'LEEKO',
#     password: 'password',
#     password_confirmation: 'password',
#     io: {
#         avi: './app/assets/images/avi/leeko.jpg',
#         bg:'./app/assets/images/bg/leekobg.jpg'
#     },
#     filename: {
#         avi: 'leeko.jpg',
#         bg: 'leekbg.jpg'
#     },
#     content_type: {
#         avi: 'image/jpg',
#         bg: 'image/jpg'
#     }
#     },
#     {
#     email: 'london@gmail.com',
#     username: '_CoverOfElle',
#     name: 'shawty lo.',
#     password: 'password',
#     password_confirmation: 'password',
#     io: {
#         avi: './app/assets/images/avi/london.jpg',
#         bg:'./app/assets/images/bg/londonbg.jpg'
#     },
#     filename: {
#         avi: 'london.jpg',
#         bg: 'londonbg.jpg'
#     },
#     content_type: {
#         avi: 'image/jpg',
#         bg: 'image/jpg'
#     }
#     },
#     {
#     email: 'ron@gmail.com',
#     username: 'ThepplsChamp_',
#     name: 'RealVibes',
#     password: 'password',
#     password_confirmation: 'password',
#     io: {
#         avi: './app/assets/images/avi/ronny.jpg',
#         bg:'./app/assets/images/bg/ronnybg.jpg'
#     },
#     filename: {
#         avi: 'ronny.jpg',
#         bg: 'ronnybg.jpg'
#     },
#     content_type: {
#         avi: 'image/jpg',
#         bg: 'image/jpg'
#     }
#     },
#     {
#     email: 'steel@gmail.com',
#     username: 'SteeloBoaaa',
#     name: 'Doe',
#     password: 'password',
#     password_confirmation: 'password',
#     io: {
#         avi: './app/assets/images/avi/steel.jpg',
#         bg:'./app/assets/images/bg/steelbg.jpg'
#     },
#     filename: {
#         avi: 'steel.jpg',
#         bg: 'steelbg.jpg'
#     },
#     content_type: {
#         avi: 'image/jpg',
#         bg: 'image/jpg'
#     }
#     },
#     {
#     email: 'stew@gmail.com',
#     username: '1stonerpimpson',
#     name: 'STEW',
#     password: 'password',
#     password_confirmation: 'password',
#     io: {
#         avi: './app/assets/images/avi/stew.jpg',
#         bg:'./app/assets/images/bg/stewbg.jpg'
#     },
#     filename: {
#         avi: 'stew.jpg',
#         bg: 'stewbg.jpg'
#     },
#     content_type: {
#         avi: 'image/jpg',
#         bg: 'image/jpg'
#     }
#     }

# ] 
   users = [{
    email: 'slim@gmail.com',
    username: 'caramel__delite',
    name: 'Slim',
    password: 'password',
    password_confirmation: 'password',
    io: './app/assets/images/avi/slim.jpg',
    filename: 'slim.jpg',
    content_type: 'image/jpg'
    }]
    for user in users do 
        saved_user = User.create(email: user[:email], username: user[:username], name: user[:name], password: user[:password], password_confirmation: user[:password_confirmation])
        saved_user.avatar.attach(io: File.open(user[:io]) , filename: user[:filename] , content_type: user[:content_type])
        # saved_user.background.attach(io: File.open(user[:io][:bg]) , filename: user[:filename][:bg] , content_type: user[:content_type][:bg])
    end
