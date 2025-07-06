import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FzlLayoutMain } from './fzl-layout-main';

describe('FzlLayoutMain', () => {
  let component: FzlLayoutMain;
  let fixture: ComponentFixture<FzlLayoutMain>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [FzlLayoutMain]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FzlLayoutMain);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
