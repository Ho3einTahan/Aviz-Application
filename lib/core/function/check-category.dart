int CheckCategory(String CategoryName) {
  switch (CategoryName) {
    case 'اجاره مسکونی':
      return 1;

    case 'فروش مسکونی':
      return 2;

    case 'فروش دفاتر اداری و تجاری':
      return 3;

    case 'اجاره دفاتر اداری و تجاری':
      return 4;

    case 'اجاره کوتاه مدت':
      return 5;

    case 'پروژه های ساخت و ساز':
      return 6;
  }
  return 1;
}
