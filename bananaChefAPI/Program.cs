using BananaChefBLL.Interfaces;
using BananaChefBLL.Services;
using BananaChefDAL.Context;
using BananaChefDAL.Interfaces;
using BananaChefDAL.Repositories;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//JWT
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(
    options =>
    {
        options.SaveToken = true;
        options.TokenValidationParameters = new TokenValidationParameters()
        {
            ValidateIssuer = true,
            ValidateAudience = true,
            ValidateLifetime = true,
            ValidateIssuerSigningKey = true,
            ValidIssuer = builder.Configuration["jwt:issuer"],
            ValidAudience = builder.Configuration["jwt:audience"],
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["jwt:key"]))
        };
    }
    );

//JWT
builder.Services.AddScoped<IJwtService, JwtService>();
//DAL
/** User **/
builder.Services.AddScoped<IUserRepository, UserRepository>( sp =>
    new UserRepository(
        new System.Data.SqlClient.SqlConnection(
            builder.Configuration.GetConnectionString("default")
            )
        )
);
/** Recipe **/
builder.Services.AddScoped<IRecipeRepository, RecipeRepository>(sp =>
    new RecipeRepository(
        new System.Data.SqlClient.SqlConnection(
            builder.Configuration.GetConnectionString("default")
            )
        ));
//BLL
/** User **/
builder.Services.AddScoped<IUserService, UserService>();
/** Recipe **/
builder.Services.AddScoped<IRecipeService, RecipeService>();
//DBSet
builder.Services.AddDbContext<DataContext>();

//builder.Services.AddScoped<IGameRepository, GameService>(sp =>
//    new GameService(
//        new System.Data.SqlClient.SqlConnection(
//            builder.Configuration.GetConnectionString("default"))));



var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
