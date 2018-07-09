using System;
using System.Collections.Generic;
using Android.App;
using Autofac;
using MkCoreLibrary.Core;
using MkCoreLibrary.PlatformManagement.Infrastructure;
using SafeCloud.ClientCore.Infrastructure;
using SafeCloud.ClientCore.MVVM.ViewModels;
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
            builder.RegisterType<DroidMessageController>().As<IMessageController<Activity>>();

            Container = builder.Build();
        }

        protected override void SetupMapping()
        {
            if (ViewMapper == null) ViewMapper = new Dictionary<Type, Type>();
            ViewMapper.Add(typeof(AuthorizationViewModel), typeof(AuthorizationView));
            ViewMapper.Add(typeof(LauncherViewModel), typeof(LauncherView));
            ViewMapper.Add(typeof(MainNavigationViewModel), typeof(MainNavigationScreen));
            ViewMapper.Add(typeof(FileListViewModel), typeof(MainView));
            ViewMapper.Add(typeof(DebugViewModel), typeof(DebugView));
            ViewMapper.Add(typeof(SettingsViewModel), typeof(SettingsView));
        }
    }
}