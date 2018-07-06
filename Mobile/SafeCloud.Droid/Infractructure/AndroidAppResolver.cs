using System;
using System.Collections.Generic;
using Android.App;
using Autofac;
using SafeCloud.ClientCore.Infrastructure;
using SafeCloud.ClientCore.MVVM.ViewModels;
using SafeCloud.ClientCore.MVVM.ViewModels.AuthStructure;
using SafeCloud.ClientCore.MVVM.ViewModels.Debug;
using SafeCloud.ClientCore.MVVM.ViewModels.FileStructure;
using SafeCloud.Droid.Facade;
using SafeCloud.Droid.Views;
using SafeCloud.Droid.Views.Fragments;

namespace SafeCloud.Droid.Infractructure
{
    class AndroidAppResolver : AppResolver
    {
        protected override void SetupContainer()
        {
            var builder = new ContainerBuilder();

            builder.RegisterType<DroidNavigator>().As<INavigator>();
            builder.RegisterType<DroidPermissionManager>().As<IPermissionManager<Activity>>();
            builder.RegisterType<SharedPreferences>().As<IKeyValuePairStorage<Activity>>();

            Container = builder.Build();
        }

        protected override void SetupMapping()
        {
            if (ViewMapper == null) ViewMapper = new Dictionary<Type, (Type ParentPage, Type ContentPage)>();
            ViewMapper.Add(typeof(AuthorizationViewModel), (null, typeof(AuthorizationView)));
            ViewMapper.Add(typeof(LauncherViewModel), (null, typeof(LauncherView)));
            ViewMapper.Add(typeof(FileListViewModel), (typeof(MainNavigationScreen), typeof(MainView)));
            ViewMapper.Add(typeof(DebugViewModel), (typeof(MainNavigationScreen), typeof(DebugView)));
        }
    }
}