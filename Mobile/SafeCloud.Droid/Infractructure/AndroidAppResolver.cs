using System;
using System.Collections.Generic;
using Android.App;
using Autofac;
using SafeCloud.ClientCore.Infrastructure;
using SafeCloud.ClientCore.MVVM.ViewModels;
using SafeCloud.ClientCore.MVVM.ViewModels.AuthStructure;
using SafeCloud.ClientCore.MVVM.ViewModels.FileStructure;
using SafeCloud.Droid.Facade;
using SafeCloud.Droid.Views;

namespace SafeCloud.Droid.Infractructure
{
    class AndroidAppResolver : AppResolver
    {
        protected override void SetupContainer()
        {
            var builder = new ContainerBuilder();

            builder.RegisterType<DroidNavigator>().As<INavigator>();
            builder.RegisterType<SharedPreferences>().As<IKeyValuePairStorage<Activity>>();

            Container = builder.Build();
        }

        protected override void SetupMapping()
        {
            if (ViewMapper == null) ViewMapper = new Dictionary<Type, Type>();
            ViewMapper.Add(typeof(AuthorizationViewModel), typeof(AuthorizationView));
            ViewMapper.Add(typeof(LauncherViewModel), typeof(LauncherView));
            ViewMapper.Add(typeof(FileListViewModel), typeof(MainView));
        }
    }
}